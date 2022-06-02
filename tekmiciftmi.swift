import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var text1: UITextField!
    @IBOutlet weak var lblResult: UILabel!
    
    override func viewDidLoad() {
        
        
        super.viewDidLoad()
        
    }

    @IBAction func Button(_ sender: Any) {
//        butona basıldıktan sonra çalışacak kısım
        
        let number = text1.text ?? ""
        
        if number.isEmpty {
            lblResult.text = "Lütfen bir sayı girin."
            return
        }
        
        if let n1 = Int(number) {
//            mod alma işlemi
            
            if n1 % 2 == 0 {
                lblResult.text = "Girilen sayı çifttir."
            } else {
                lblResult.text = "Girilen sayı tektir."
            }
    }else {
        lblResult.text = "Lütfen bir rakam giriniz."
    }
}
}
