

import Foundation
import Accounts


protocol Loginable {
                //замыкания
                //имя замыкания completion
                //String,Error типы которые будут передаваться в замыкание
    func login(completion:@escaping (String?,Error?)->Void)
}

class FacebookLogin:Loginable{
    //реализация
    func login(completion:@escaping (String?, Error?) -> Void) {
        //переменная которая имеет доступ к хранилищу акаунтов
        let accountsStore = ACAccountStore()
        //переменная которая имеет доступ к аккаунту фейсбука
        let facebook = accountsStore.accountType(withAccountTypeIdentifier: ACAccountTypeIdentifierFacebook);
        //ключ который создается в аккаунте разработчика для того чтобы данные предоставлялись //правила фейсбук сдк
        let apiKey = ""
        //опции для логина
                        //ключ
                                                //данные которые мы хотим получить от пользователя
        let option = [ACFacebookAppIdKey:apiKey,ACFacebookPermissionsKey:["email"]] as [String : Any]
        
        //запрос к accountsStore
        //передается аккаунт фейсбук
        //опции
        //третим передается замыкание и в результате его правильной работы нам вернется succes в противном случае error 
        //это нужно правильно обработать
        accountsStore.requestAccessToAccounts(with: facebook, options: option) { (success, error) in
            var email:String? = nil
            if(success){
                //получаем доступ к аккаунту
               let account = accountsStore.accounts(with: facebook)
                if let facebookAccount = account?.last as? ACAccount{
                    let desctiptionAccount = facebookAccount.description
                    print("facebookAccount.description \(desctiptionAccount)")
                }
                
            }else{
                print("facebook error \(error?.localizedDescription)")
            }
            
            //и в переданную в сигнатуру функцию передается 
            completion(email, error)
        }
        
    }
}

class TwitterLogin:Loginable{
    func login(completion: @escaping (String?, Error?) -> Void) {
//
    }

 
}
