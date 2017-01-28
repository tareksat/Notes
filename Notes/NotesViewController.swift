import UIKit

class NotesViewController: UIViewController {
    
    @IBOutlet weak var deleteBTN: UIBarButtonItem!
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var noteTextArea: UITextView!
    
    var _note : NoteCls? = nil
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if _note != nil{
            titleTextField.text = _note?.title
            noteTextArea.text = _note?.note
        }
        
    }
    
    
    @IBAction func saveAction(_ sender: Any) {
        
        if _note != nil{
            _note?.title = titleTextField.text
            _note?.note  = noteTextArea.text
        }
        else{
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            
            let note = NoteCls(context: context)
            
            note.title = titleTextField?.text
            note.note = noteTextArea?.text

        }
        
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)
    }
    
    @IBAction func deleteAction(_ sender: Any) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        context.delete(_note!)
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
        
        navigationController!.popViewController(animated: true)

        
        
    }
    
    
}
