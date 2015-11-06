# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http:#coffeescript.org/

floatingMenu.add('floatdiv',  
  {  
    # Represents distance from left or right browser window  
    # border depending upon property used. Only one should be  
    # specified.  
    # targetLeft: 0,  
    targetRight: 10,  
  
    # Represents distance from top or bottom browser window  
    # border depending upon property used. Only one should be  
    # specified.  
    targetTop: 10,  
    # targetBottom: 0,  
  
    # Uncomment one of those if you need centering on  
    # X- or Y- axis.  
    # centerX: true,  
    # centerY: true,  
  
    # Remove this one if you dont want snap effect  
    #snap: true  
  }
);  
