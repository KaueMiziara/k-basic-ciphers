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
                if (char.is_ascii()) && (char != ' ') && !(char.is_numeric()) {
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
                if (char.is_ascii()) && (char != ' ') && !(char.is_numeric()) {
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
        shift: QString,
    }

    impl Default for VigenereObject {
        fn default() -> Self {
            Self {
                text_input: QString::from(""),
                text_output: QString::from(""),
                shift: QString::from(""),
            }
        }
    }

    impl qobject::CaesarObject {
        #[qinvokable]
        pub fn cipher_v(self: Pin<&mut Self>) -> QString {
            QString::from("")
        }

        #[qinvokable]
        pub fn decipher_v(self: Pin<&mut Self>) -> QString {
            QString::from("")
        }
    }
}
