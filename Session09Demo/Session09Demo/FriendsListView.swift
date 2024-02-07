import SwiftUI


// for simplicity i've defined the friend here
// but you should put this in a new file
struct Friend:Identifiable {
    var id:UUID = UUID()
    var name:String
    var age:Int = 10
}
struct FriendsListView: View {
    // data structure for the view
    @State private var friendsList = [
        Friend(name:"Amy"),
        Friend(name:"Bob")
    ]
    
    @State private var friendNameFromUI:String = ""
    
    var body: some View {
        VStack(alignment: .leading)
        {
            Text("My Friends")
                .font(.title)
                .padding(.bottom)
            
            Text("Enter name")
            TextField("Example: David", text:$friendNameFromUI)
            
            Button {
                // add friend
                let friendToAdd = Friend(name:friendNameFromUI)
                friendsList.append(friendToAdd)
                
                // clear text boxes
                friendNameFromUI = ""
            } label: {
                Text("Add Friend")
            }
            .buttonStyle(.borderedProminent)
            .padding(.bottom)
            
            List {
                ForEach(friendsList) {
                    friend in
                    Text(friend.name)
                }
            }.listStyle(.plain)
        }
    }
}
struct FriendsListView_Previews: PreviewProvider {
    static var previews: some View {
        FriendsListView()
    }
}
