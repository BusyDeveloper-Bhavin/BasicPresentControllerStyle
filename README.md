# BasicPresentControllerStyle
A Simple way to present a controller with subviews animation.


## With Animation & Without Animation

How it looks like with animation and without animation

## Single View
![list](https://github.com/BusyDeveloper-Bhavin/BasicPresentControllerStyle/blob/master/animate.GIF)
![list](https://github.com/BusyDeveloper-Bhavin/BasicPresentControllerStyle/blob/master/wa1.gif)

## Mutiple Views
![list](https://github.com/BusyDeveloper-Bhavin/BasicPresentControllerStyle/blob/master/animate2.gif)
![list](https://github.com/BusyDeveloper-Bhavin/BasicPresentControllerStyle/blob/master/wa2.gif)

## Mutiple Views over current viewcontoller
![list](https://github.com/BusyDeveloper-Bhavin/BasicPresentControllerStyle/blob/master/animate3.gif)
![list](https://github.com/BusyDeveloper-Bhavin/BasicPresentControllerStyle/blob/master/wa3.gif)


# Few simple steps to add animation 

    1. First set animator 
            
       var animator : VBAnimator = VBAnimator()
       let obj = UIViewController()
       obj.transitioningDelegate = animator
       self.present(obj, animated: true, completion: nil)
   
    2. Second assign views in next view contoller using protocol
    
        extension NextVC: VBProtocol {
           var multipleViews: [UIView] {
              return [centerView] // set your outlets here
            }
        }
    
    Note: obj.modalPresentationStyle = .overFullScreen //Use full screen insted of overCurrentContext or currentContext
