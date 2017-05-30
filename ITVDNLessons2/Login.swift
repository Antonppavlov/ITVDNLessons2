import Foundation
import Accounts


protocol Loginable {
    //замыкания
    //имя замыкания completion
    //String,Error типы которые будут передаваться в замыкание
    func login(completion: @escaping (String?, Error?) -> Void)
}

extension Loginable {
    func getIdentifier(from account: ACAccount?, response: (success: Bool, error: Error?)) -> String? {
        let identifier: String?

        if response.success {
            if let currentaccount = account {
                  identifier = currentaccount.identifier as String?
//                print("identifier = \(identifier)")
            }else {
                identifier=nil
            }

        } else {
            if let error = response.error {
                print("Error \(error)")
            }
                identifier = nil
        }

        return identifier
    }
}

class FacebookLogin: Loginable {
    //реализация
    func login(completion: @escaping (String?, Error?) -> Void) {
//        //переменная которая имеет доступ к хранилищу акаунтов
        let accountsStore = ACAccountStore()
//        //переменная которая имеет доступ к аккаунту фейсбука
        let facebook = accountsStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierFacebook)
//        //ключ который создается в аккаунте разработчика для того чтобы данные предоставлялись //правила фейсбук сдк
        let apiKey = "227426014411493"
//        //опции для логина
//        //ключ
//        //данные которые мы хотим получить от пользователя
        let option = [ACFacebookAppIdKey: apiKey, ACFacebookPermissionsKey: ["email"]] as [String: Any]
//
//        //запрос к accountsStore
//        //передается аккаунт фейсбук
//        //опции
//        //третим передается замыкание и в результате его правильной работы нам вернется succes в противном случае error 
//        //это нужно правильно обработать
        accountsStore.requestAccessToAccounts(with: facebook, options: option) { (success, error) in
            let accounts = accountsStore.accounts(with: facebook)
            if let lastAccount =  accounts?.last as? ACAccount?{
                self.getIdentifier(from: lastAccount, response: (success: success  , error: error))
            }
                       //            let email: String? = nil
//
//            if (success) {
//                //получаем доступ к аккаунту
//                //                if let facebookAccount = account?.last as? ACAccount {
//                    let identifier = facebookAccount.identifier
////                    print("facebookAccount.description = \(identifier)")
//                }
//
//            } else {
//                print("Error \(describing: error?.localizedDescription)")
//            }
//
//            //и в переданную в сигнатуру функцию передается
//            completion(email, error)
//        }

    }
}

class TwitterLogin: Loginable {
    func login(completion: @escaping (String?, Error?) -> Void) {
        let accountsStore = ACAccountStore()
        let twitter = accountsStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierTwitter)

        accountsStore.requestAccessToAccounts(with: twitter, options: nil) { (success, error) in

        }
    }


}
