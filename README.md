# OTSortButton

## Description
 OTSortButton is a UIButton library useful for sorting.

## Features
・Change appearance for each parts and sort types.

## Demo
![otsortbuttondemo](https://user-images.githubusercontent.com/20692907/30483166-d765c672-9a60-11e7-8753-87bdcf4cdddc.gif)
 
## Usage
1.Set OTSortButton to Custom Class and Module of your UIButton. 

![2017-09-15 21 10 54](https://user-images.githubusercontent.com/20692907/30481581-6a2e9166-9a5a-11e7-939d-ccec96b11136.png)


The appearance can be set with IBInspectable.

![2017-09-15 21 27 45](https://user-images.githubusercontent.com/20692907/30482111-c25eb6fc-9a5c-11e7-9d21-50924081d4a6.png)

2.Import and connect IBOutlet

```swift
import OTSortButton

@IBOutlet var sortButtonCollection: [OTSortButton]!
```

3.If you want to set the key on the button, please set it as the sort key

```swift

@IBOutlet weak var yourSortButton: OTSortButton!

yourSortButton.sortKey = "yourKey"

```

4.Connect IBAction

```swift
@IBAction func tappedSortButton(_ sender: OTSortButton) {
	for sortButton in sortButtonCollection {
		if sortButton == sender {
	        	let key = sortButton.sortKey
			switch sortButton.sortType {
			case .none:
			
		    		sortButton.sortType = .ascend
		    		// Sort ascend here.
       	    			//e.g. sortedArray = yourArray.sorted(by: { $0[key]! < $1[key]! })
				
    			case .ascend:
			
       				sortButton.sortType = .descend
				// Sort descend here.
     	   			//e.g. sortedArray = yourArray.sorted(by: { $0[key]! > $1[key]! })
				
        		case .descend:
			
				sortButton.sortType = .none
           			// Undo here.
           			//e.g. sortedArray = yourArray     
			}
   		} else {
       			sortButton.sortType = .none
     		}
	}
	yourView.reloadData()
}


```

## Install

### CocoaPods  
Add this to your Podfile.

```PodFile
pod 'OTSortButton'
```

### Carthage  
Add this to your Cartfile.

```Cartfile
github "PKPK-Carnage/OTSortButton"
```

## Help

If you want to support this framework, you can do these things.

* Please let us know if you have any requests for me.

	I will do my best to live up to your expectations.

* You can make contribute code, issues and pull requests.
	
	I promise to confirm them.

## Licence

[MIT](https://github.com/PKPK-Carnage/OTSortButton/blob/master/LICENSE)

## Author

[PKPK-Carnage🦎](https://github.com/PKPK-Carnage)
