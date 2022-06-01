import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var text2: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
//        kullanıcı adı ve parola girilsin
//        parola ve kullanıcı adı doğru ise başarılı değilse başarısız sonucu döndürülsün
        
    }

    @IBAction func btnCalculator(_ sender: Any) {
        
//        butona tıkladıktan sonra çalışacak olan kısım.
        
        let username = "betul"
        let password = "1234"
        
        if username == text1.text && password == text2.text{
            lblResult.text = "Giriş başarılı."
        }else{
            lblResult.text = "Kullanıcı adı ya da parola hatalı."
        }
    }
    
}
