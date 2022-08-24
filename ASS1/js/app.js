var app=angular.module('myApp',[]);
app.directive('quiz',function(quiz1){
return {
    restrict: 'AE',
    scope: {},
    templateUrl:'tempalte-quiz.html',
    link: function(scope, element, attrs){
        scope.start = function(){
            scope.id=0;
            scope.inProgress = true;
            scope.getQuestion();
            scope.quizOver=false;//chưa hoàn thành
        };
        scope.reset=function(){
            scope.inProgress = false;
            scope.score=0;
        };
        scope.getQuestion=function(){
           var quiz11=quiz1.getQuestions(scope.id);
            if(quiz11){
            scope.question =quiz11.Text;
            scope.options=quiz11.Answers;
            scope.answer = quiz11.AnswerId;
            scope.answerMode =true;
            }else{
                scope.quizOver=true;
            }
        }
        scope.checkanswer=function(){
            // alert('answer');
            if(!$('input[name=answer]:checked').length) return;
            var ans=$('input[name=answer]:checked').val();
            if(ans==scope.answer){
                // alert('Đúng');
                scope.score++;
                scope.correctAns = true;
            }else{
                // alert('Sai');
                scope.correctAns = false;
            }scope.answerMode =false;
            
        };
        scope.nextQuestion=function(){
            scope.id++;
            scope.getQuestion();
            
        };
        scope.reset();
    }
}
});
const api="https://621249e601ccdac07436ea9e.mockapi.io/test";
app.factory("quiz1",function($http){
    $http.get(api).then(function(res){
        questions=res.data;
        
    });
    return{
        getQuestions: function(id){
            var count=questions.length;
            if(count>10){
             count=10;   
            }
            
            if(id<count){
                return questions[id];
            }
            else{
                return false
            }
    }
    }
});
