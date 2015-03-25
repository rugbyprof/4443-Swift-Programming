## Delegation

- Delegates are needed to pass data from 1 view controller to another.

> The variable delegate is nothing more than a reference to some object thatimplements the methods of this protocol. You can send messages to the objectfrom the delegate variable, without knowing what kind of object it really is.

### Part 1
- Start with Standard view controller
- disable Auto Layout 

--

- embed view controller into navigation controller
- add a second view controller
- add a push segue between the two

--

- Add a label to to `Needs Data`
- Add a text box and button to `Gives Data`

#### ViewController

```
class ViewController: UIViewController , DataEnteredDelegate{

    @IBOutlet weak var dataLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func userDidEnterInformation(info: String) {
        dataLabel.text = info
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showSecondVC"{
            let secondVC:SecondViewController = segue.destinationViewController as SecondViewController
            secondVC.delegate = self
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
```

#### SecondController

```
import UIKit

protocol DataEnteredDelegate{
    func userDidEnterInformation(info: String)
}

class SecondViewController: UIViewController {

    @IBOutlet weak var dataTextField: UITextField!
    
    var delegate:DataEnteredDelegate? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func sendData(sender: AnyObject) {
        if delegate != nil{
            let information: String = dataTextField.text
            
            delegate!.userDidEnterInformation(information)
            
            self.navigationController?.popViewControllerAnimated(true)
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}
```

Another View Controller

```swift
class ViewController: UIViewController , sendDataBackDelegate{

    
    @IBOutlet weak var myLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    func didSendData(controller: SecondViewController, text: String) {
        myLabel.text = text
        controller.navigationController?.popViewControllerAnimated(true)
    }
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "getDataSegue"{
            let secondVC:SecondViewController = segue.destinationViewController as SecondViewController
            secondVC.delegate = self
        }

    }
    

}
```


Another Second Controller

```swift
protocol sendDataBackDelegate{
    func didSendData(controller: SecondViewController,text:String)
}

class SecondViewController: UIViewController {

    
    @IBOutlet weak var dataText: UITextField!
    
    var delegate: sendDataBackDelegate? = nil
    
    @IBAction func sendData(sender: AnyObject) {
        if delegate != nil{
            
            println("hello world")
            
            let information: String = dataText.text
            
            delegate!.didSendData(self,text:information)
            
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
```
