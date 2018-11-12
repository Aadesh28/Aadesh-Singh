
import UIKit


class ContentVC: UIViewController , UITableViewDataSource , UITableViewDelegate
{
     var a = Array<customData>()
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath)
    {
       
      //  tableView.backgroundColor = .clear
        //tableView.layer.backgroundColor = UIColor.clear.cgColor
//        let tempImageView = UIImageView(image: UIImage(named: "bg_menu.png"))
//        tempImageView.frame = self.tableView.frame
//        self.tableView.backgroundView = tempImageView
//        cell.backgroundColor = .clear
//        UIView(); *UIStackView = [[UIView, alloc],initWithFrame,:CGRectZero];
//        backView.backgroundColor = [UIColor, clearColor];
//        cell.backgroundView = UIStackVieww;
        
        cell.layer.backgroundColor = UIColor.clear.cgColor
        cell.backgroundColor = .clear
        cell.backgroundView?.backgroundColor = .clear

    }
    
    func readJson()
    {
      
        guard let fileUrl = Bundle.main.url(forResource: "Data", withExtension: "json")
            else
        {
            print("File could not be located at the given url")
            return
        }
        do
        {
            
            let data = try Data(contentsOf: fileUrl)
            let decoder = JSONDecoder()
            let jsonData = try decoder.decode(result.self, from: data)
            
            a = jsonData.arrresult
           
            guard let dictionary = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                else
            {
                print("Could not cast JSON content as a Dictionary<String, Any>")
                return
            }
            print(dictionary)
        }
        catch
        { print("Error: \(error)") }
    }
    
    
    struct result : Codable
    {
        var arrresult : [customData]
    }
    
    
    struct customData : Codable
    {
        var time : String
        var event : String
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return a.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomCell
     
        let maindata = a[indexPath.row]
        print(maindata)
        
        cell.lblEvent.text = a[indexPath.row].event
        cell.lblEvent.text = a[indexPath.row].time


        return cell
    }
    
    var pageIndex: Int = 0
    var strTitle: String!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        readJson()
       
       
        
    }
}
//        tableView.layer.backgroundColor = UIColor.clear.cgColor
//        tableView.backgroundColor = .clear
        
//        cell.layer.backgroundColor = UIColor.clear.cgColor
//        cell.backgroundColor = .clear
//        cell.backgroundView?.backgroundColor = .clear

