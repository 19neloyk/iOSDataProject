# iOSDataProject
This app sends a get request to https://www.hackingwithswift.com/samples/friendface.json the first time it is launched to get all json data of people and each person's friends. This is possible through the URLSession class. It then stores this information with the Core Data framework. Subsequent launches of the app no longer send JSON requests; instead, the app pulls data from its Core Data entity objects.

## This is the home screen view of the app. 
It is possible to click on each person on the list to a more detailed view.
![Home Screen View](https://github.com/19neloyk/iOSDataProject/blob/master/Screen%20Shot%202020-06-08%20at%205.25.44%20PM.png)

## This is the detailed view for each profile.
It is possible to click a friend on each person's detailed view to visit another profile's detailed view. Visiting the friends of the current profile can be done recursively
![Profile View](https://github.com/19neloyk/iOSDataProject/blob/master/Screen%20Shot%202020-06-08%20at%205.25.54%20PM.png)
