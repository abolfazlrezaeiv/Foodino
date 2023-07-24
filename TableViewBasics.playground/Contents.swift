import UIKit
import PlaygroundSupport


class TableViewExampleController : UIViewController,UITableViewDataSource {
    
    
    var tableView : UITableView!
    var names : [String] = ["Abolfazl","Atena","Aniya"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createTableView()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    func createTableView() {
        tableView = UITableView(frame: CGRect(x: 200, y: 200, width: 200, height: self.view.frame.height))
        tableView.dataSource = self
        tableView.backgroundColor = .white
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        self.view.addSubview(tableView)
    }
}


PlaygroundPage.current.liveView = TableViewExampleController()
