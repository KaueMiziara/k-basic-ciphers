#[cxx_qt::bridge]
mod cxxqt_object {
    unsafe extern "C++" {
        include!("cxx-qt-lib/qstring.h");
        type QString = cxx_qt_lib::QString;
    }

    // Caesar
    #[cxx_qt::qobject]
    pub struct CaesarObject {
        #[qproperty]
        text_input: QString,
        #[qproperty]
        text_output: QString,
        #[qproperty]
        shift: u32,
    }

    impl Default for CaesarObject {
        fn default() -> Self {
            Self {
                text_input: QString::from(""),
                text_output: QString::from(""),
                shift: 0,
            }
        }
    }

    impl qobject::CaesarObject {
        #[qinvokable]
        pub fn cipher_c(self: Pin<&mut Self>) -> QString {
            let mut text: String = self.as_ref().text_input().into();

            let shift = (self.shift() % 26) as u8;
        
            text = text.to_uppercase().chars().map(|char| {
                if char.is_ascii_alphabetic() {
                    (65 + (char as u8 + shift - 65) % 26) as char
                } else {
                    char
                }
            }).collect::<String>();

            QString::from(&text)
        }

        #[qinvokable]
        pub fn decipher_c(self: Pin<&mut Self>) -> QString {
            let mut text: String = self.as_ref().text_input().into();

            let shift = (self.shift() % 26) as u8;
        
            text = text.to_uppercase().chars().map(|char| {
                if char.is_ascii_alphabetic() {
                    (65 + (char as u8 - shift + 65) % 26) as char
                } else {
                    char
                }
            }).collect::<String>();

            QString::from(&text)
        }
    }


    // Vigenere
    #[cxx_qt::qobject]
    pub struct VigenereObject {
        #[qproperty]
        text_input: QString,
        #[qproperty]
        text_output: QString,
        #[qproperty]
        key: QString,
    }

    impl Default for VigenereObject {
        fn default() -> Self {
            Self {
                text_input: QString::from(""),
                text_output: QString::from(""),
                key: QString::from(""),
            }
        }
    }

    impl qobject::VigenereObject {
        #[qinvokable]
        pub fn cipher_v(self: Pin<&mut Self>) -> QString {
            let key: Vec<u8> = if self.get_key().is_empty() {
                vec![0]
            } else {
                self.get_key()
            };
            let text: String = self.text_input().into();
            let mut text = text.to_uppercase();

            text = text.char_indices().map(|(index, char)| {
                if char.is_ascii_alphabetic() {
                    (65 + (char as u8 + key[index % key.len()] - 65) % 26) as char
                } else {
                    char
                }
            }).collect();

            QString::from(&text[..])
        }

        #[qinvokable]
        pub fn decipher_v(self: Pin<&mut Self>) -> QString {
            let key: Vec<u8> = if self.get_key().is_empty() {
                vec![0]
            } else {
                self.get_key()
            };
            let text: String = self.text_input().into();
            let mut text = text.to_uppercase();

            text = text.char_indices().map(|(index, char)| {
                if char.is_ascii_alphabetic() {
                    (65 + (char as u8 - key[index % key.len()] + 65) % 26) as char
                } else {
                    char
                }
            }).collect();

            QString::from(&text[..])
        }

        fn get_key(&self) -> Vec<u8> {
            let key: String = self.key().into();
            let key = key.to_uppercase();
            let key = key.as_bytes();
            
            let keys: Vec<u8> = key.iter().map(|key| {
                if (*key as char).is_alphabetic() {
                    (key + 1) - 65
                } else if (*key as char).is_numeric() {
                    (*key) + 4
                } else {
                    0
                }
            }).collect();

            keys
        }
    }
}
