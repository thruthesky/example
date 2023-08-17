# Example App for Fireflutter

This project is an example app for demonstration of how to use Fireflutter.

## Navigation Diagram

This diagram will represent how the user may navigate the screens in the example app.

```mermaid
flowchart TB

start([Start]) -->|Entered the chat room list| chatRoomList(Chat Room List Screen)
chatRoomList ------->|Exited chat room list| exit([End])
chatRoomList -->|Pressed Add Button| createNewRoom(Create New Room Popup)
chatRoomList -->|Entered a chat room| chatRoomScreen(Chat Room Screen)
createNewRoom -->|Created Room| chatRoomScreen
createNewRoom -->|Cancelled creating room| chatRoomList
chatRoomScreen -->|Exited chat room| chatRoomList
chatRoomScreen -->|Opened Chat room menu| chatRoomMenu(Chat Room Menu)
chatRoomMenu -->|Closed chat room menu| chatRoomScreen
chatRoomMenu -->|Opened Invite User Screen| inviteUser(Invite User Screen)
inviteUser -->|Closed invite user screen| chatRoomMenu
chatRoomMenu -->|Admin: Open Settings| settings(Settings Screen)
settings -->|Close Settings| chatRoomMenu
```

### Chat Message Send Flowchat

```mermaid
flowchart TD
inputBox-->sendMessage
sendMessage-->updateRoom
sendMessage-->cloudFunctions>Cloud Functions]-->notification(Send Push Notification)
```

### Photo Send Flowchart

```mermaid
flowchart TD
mediaSource[Media Source]-->photoUpload[Photo Upload]
photoUpload-->updateRoom
photoUpload-->sendMessage
sendMessage-->cloudFunctions>Cloud Functions]-->notification(Send Push Notification)
```

<!--
    TODO:
    Add more flowcharts
 -->
