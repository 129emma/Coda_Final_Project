/**
 * Created by yzhb363 on 3/06/2017.
 */
$(document)
    .ready(function() {

        $('.firstMenu').visibility({

            once:false,
            continuous:true,
             onBottomPassed:function () {
                 $('.overlay.secondMenu').visibility({
                     type:'fixed',
                     offset:10
                 })
             },

        })




    })
;