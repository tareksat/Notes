
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var noteList : [NoteCls] = []
    
    override func viewDidLoad() {
        
        tableView.dataSource = self
        tableView.delegate = self
        
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
        
        do{
            noteList = try context.fetch(NoteCls.fetchRequest())
            tableView.reloadData()
        }catch{
            
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return noteList.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        cell.textLabel?.text  = noteList[indexPath.row].title
        cell.imageView?.image = UIImage(named: "n1")
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let note = noteList[indexPath.row]
        performSegue(withIdentifier: "noteSegue", sender: note)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    
        let nextVC = segue.destination as! NotesViewController
        nextVC._note = sender as? NoteCls
        
    }

    

}

