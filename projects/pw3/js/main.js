var app = angular.module('NewDawn',
    ['ui.router', 'ngAnimate', 'ngSanitize', 'ngTouch', 'newDawnCtrl']);

app.config(function ($stateProvider, $urlRouterProvider, $locationProvider) {

    $urlRouterProvider.otherwise("home");
    $locationProvider.html5Mode(true);
    $stateProvider
        .state('home', {
            controller: 'HomeCtrl',
            url: "/home",
            templateUrl: "assets/partials/home.html"
        })
        .state('me', {
            controller: 'MeCtrl',
            url: "/me",
            templateUrl: "assets/partials/me.html"
        })
        .state('portfolio', {
            controller: 'PortfolioCtrl',
            url: "/portfolio",
            templateUrl: "assets/partials/portfolio.html"
        })
        .state('experience', {
            controller: 'ExperienceCtrl',
            url: "/experience",
            templateUrl: "assets/partials/experience.html"
        })
        .state('contact', {
            controller: 'ContactCtrl',
            url: "/contact",
            templateUrl: "assets/partials/contact.html"
        })
        .state('roadmap', {
            controller: 'RoadmapCtrl',
            url: "/roadmap",
            templateUrl: "assets/partials/roadmap.html"
        });

});

app.run(['$rootScope', '$http', '$interval', function ($rootScope, $http, $interval) {
    $rootScope.rootUrl = "";
    $rootScope.bgImages = "";

    $http.get($rootScope.rootUrl + '/php/returnBGimages.php')
        .then(
            //SUCCESS
            function (data) {
                $rootScope.bgImages = data.data;
            },
            //ERROR
            function (data) {
            });


    $rootScope.actual = 0;

    $interval(function () {

            $rootScope.actual = ($rootScope.actual + 1 > $rootScope.bgImages.length - 1) ? 0 : $rootScope.actual + 1;
        }, 20000

    )
    ;

}]);


app.filter('filterPortfolio', function () {
    return function (projects, needles, isAnd) {
        isAnd = isAnd === undefined ? true : isAnd;
        return projects.filter(function (project) {
            var confirmedNeedles = [] ;
            var haystack   = [];

            haystack.push(project.title.toLowerCase());
            haystack.push(project.description.toLowerCase());

            angular.forEach(project['skills'],function(e){
                haystack.push(e.name.toLowerCase());
            });
            angular.forEach(project['tags'],function(e){
                haystack.push(e.name.toLowerCase());
            });

            var haystackStr  = haystack.join(' ');

            if (needles.length > 0) {
                for (var g in needles) {
                    var needle = needles[g].toLowerCase();
                    if (haystackStr.indexOf(needle) !== -1) {
                        confirmedNeedles.push(needles[g]);
                        if(!isAnd)return true;
                    }

                }
                if(confirmedNeedles.length === needles.length && isAnd) return true;
                else return false;
            }

            else{
                return true;
            }
       });
    };
});

var ctrl = angular.module('newDawnCtrl', []);








//http://deepinthecode.com/2014/08/05/converting-a-sql-datetime-to-a-javascript-date/
function DatetimeToJsDate(sqlDate){
    //sqlDate in SQL DATETIME format ("yyyy-mm-dd hh:mm:ss.ms")
    var sqlDateArr1 = sqlDate.split("-");
    //format of sqlDateArr1[] = ['yyyy','mm','dd hh:mm:ms']
    var sYear = sqlDateArr1[0];
    var sMonth = (Number(sqlDateArr1[1]) - 1).toString();
    var sqlDateArr2 = sqlDateArr1[2].split(" ");
    //format of sqlDateArr2[] = ['dd', 'hh:mm:ss.ms']
    var sDay = sqlDateArr2[0];
    var sqlDateArr3 = sqlDateArr2[1].split(":");
    //format of sqlDateArr3[] = ['hh','mm','ss.ms']
    var sHour = sqlDateArr3[0];
    var sMinute = sqlDateArr3[1];
    var sqlDateArr4 = sqlDateArr3[2].split(".");
    //format of sqlDateArr4[] = ['ss','ms']
    var sSecond = sqlDateArr4[0];
    var sMillisecond = sqlDateArr4[1];

    return new Date(sYear,sMonth,sDay,sHour,sMinute,sSecond,sMillisecond);
}

function DateSQLToJsDate(sqlDate){
    //sqlDate in SQL DATETIME format ("yyyy-mm-dd hh:mm:ss.ms")
    var sqlDateArr1 = sqlDate.split("-");
    //format of sqlDateArr1[] = ['yyyy','mm','dd hh:mm:ms']
    var sYear = sqlDateArr1[0];
    var sMonth = (Number(sqlDateArr1[1]) - 1).toString();
    var sDay = sqlDateArr1[2];



    return new Date(sYear,sMonth,sDay);
}

function wildSearch(str, rule) {
    return new RegExp("^" + rule.split("*").join(".*") + "$").test(str);
}
var meLeisuresResize = function(){

    var bg = $("#leisures-bg");
    var text = $("#leisures-text");

    var padText = parseInt(text.css('padding-bottom'));
    var newHeight = text.outerHeight(true);
    bg.height(newHeight);

};

var openCloseMenu = function(closedFromOutside){
  closedFromOutside = closedFromOutside || false;


    var button = $('#hamburger');
    var menu = $('#unroll');
    var mainMenu = $('nav');
    var link = $('#unroll a');

    if (button.hasClass('active') || menu.hasClass('active') || closedFromOutside){
        button.removeClass('active');
        mainMenu.removeClass('active');
        menu.removeClass('active');
    }
    else{
        button.addClass('active');
        mainMenu.addClass('active');
        menu.addClass('active');
    }
};

//Menu open/close responsive
$(function () {

    $("#unroll a").click(function(){openCloseMenu(true)});

});


ctrl.controller('ContactCtrl', ['$scope',
    '$http',
    '$rootScope','$sce',
    function ($scope, $http, $rootScope, $sce) {
        $rootScope.footer = "Une animation viendra dynamiser le tout !";

        $scope.reset = {
            name: '',
            email: '',
            subject: '',
            mail: ''
        };

        $scope.send = function () {
            $http({
                method: "POST",
                url: $rootScope.rootUrl+"/php/sendMail.php",
                data: $.param($scope.maildata),
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                }
            }).then(
                function (data) {
                    var response = data.data;
                    if (response.success) {
                        $scope.maildata = angular.copy($scope.reset);
                        $scope.response = response.success;
                    }
                    else{
                        $scope.response = response.error;
                    }
                },
                function (data) {
                    $scope.response = "Soucis technique, le mail est même pas arrivé jusqu'au serveur, la loose";
                });
        };

    }]);

ctrl.controller('ExperienceCtrl', ['$scope',
    '$http','$rootScope',
    function ($scope, $http, $rootScope) {

        $rootScope.footer = "Peu d'expériences mais très curieux !";

        $scope.experiences = "";
        $http.get($rootScope.rootUrl+'/php/returnExperience.php')
            .then(
                //SUCCESS
                function (data) {
                    $scope.experiences = data.data;
                },
                //ERROR
                function (data) {
                });

        $scope.openedIndex = -1;
        $scope.open = function ($index) {
            if ($scope.openedIndex != $index)
                $scope.openedIndex = $index;
            else
                $scope.openedIndex = -1;
        };


        $scope.formatDateString = function(datesql){
            var options = {year: 'numeric', month: 'long', day: 'numeric' };

            var date = DateSQLToJsDate(datesql);
            return date.toLocaleString('fr-FR', options);


        }
    }]);
ctrl.controller('HomeCtrl', ['$scope',
    '$state',
    '$http','$rootScope',
    function ($scope, $state, $http, $rootScope) {

        $rootScope.footer = "Première version de cette refonte, des mises à jours sont prévues. " +
            "Plus d'infos dans la section Roadmap.";
        $scope.infos = "";
        $http.get($rootScope.rootUrl+'/php/returnInfos.php')
            .then(
                //SUCCESS
                function (data) {
                    $scope.infos = data.data;
                },
                //ERROR
                function (data) {
                });
        $rootScope.$state = $state;
}]);

/**
 * Created by Miloud on 21/12/2016.
 */

ctrl.controller('MeCtrl', ['$scope',
    '$state',
    '$http', '$rootScope',
    function ($scope, $state, $http, $rootScope) {

        $scope.calculateAge = function calculateAge(birthday) { // birthday is a date
            var ageDifMs = Date.now() - birthday.getTime();
            var ageDate = new Date(ageDifMs); // miliseconds from epoch
            return Math.abs(ageDate.getUTCFullYear() - 1970);
        };

        $rootScope.footer = 'Enchanté !';
        $scope.infos = '';
        $scope.leisures = "";
        $http.get($rootScope.rootUrl + '/php/returnInfos.php')
            .then(
                //SUCCESS
                function (data) {
                    $scope.infos = data.data;
                },
                //ERROR
                function (data) {
                });

        $http.get($rootScope.rootUrl + '/php/returnLeisures.php')
            .then(
                //SUCCESS
                function (data) {
                    data.data.forEach(function(e){
                        $scope.leisures += " • " + e.leisure_fr;
                    });
                    $scope.leisures += $scope.leisures;
                    $scope.leisures += $scope.leisures;


                },
                //ERROR
                function (data) {
                });
        $rootScope.$state = $state;



        $( document ).ready(function() {

            meLeisuresResize();
            $(window).resize(function(){
                meLeisuresResize();
            });


        });
    }]);
ctrl.controller('PortfolioCtrl',
    ['$scope',
        '$http', '$rootScope', '$filter',
        function ($scope, $http, $rootScope, $filter) {
            $rootScope.footer = "Cette section est en perpétuelle évolution.";
            $scope.viewerOn = false;
            $scope.portfolio = [];
            $scope.skills = [];
            $scope.tags = [];
            $scope.search = "";
            $scope.projectLimit = 6;
            $scope.show = false;
            $scope.FilterAndOr = true;
            $scope.thereIsMore = false;
            $scope.criterias = [];
            $scope.allTags = [];
            $scope.tagInitialLimit = 10;
            $scope.tagLimit = $scope.tagInitialLimit;

            $scope.resetP = {
              id : 0,
              preview : "",
              original : "",
              tag : {},
              skills: {},
              description :"",
              title : "",
              date  : new Date()
            };

            $scope.p = $scope.resetP;

            var countOccurence = function (json, needle) {
                return $filter('filter')(json, needle).length;
            };

            $http.get($rootScope.rootUrl + '/php/returnPortfolio.php')
                .then(
                    //SUCCESS
                    function (data) {
                        $scope.portfolio = data.data['portfolio'];
                        $scope.skills = data.data['skills'];
                        $scope.tags = data.data['tags'];

                        $scope.thereIsMore = ($scope.portfolio.length > $scope.projectLimit);
                        $scope.skills.forEach(function (skill) {
                            skill.occurence = countOccurence($scope.portfolio, skill.name);
                            skill.isActive = false;
                            var filter = {
                                name: skill.name,
                                occurence: skill.occurence,
                                isActive: skill.isActive,
                                img: skill.img
                            };
                            $scope.allTags.push(filter);
                        });
                        $scope.tags.forEach(function (tag) {
                            tag.occurence = countOccurence($scope.portfolio, tag.name);
                            tag.isActive = false;

                            var filter = {
                                name: tag.name,
                                occurence: tag.occurence,
                                isActive: tag.isActive,
                                img: (typeof(tag.img) !== undefined && tag.img !== "") ? tag.img : false
                            };
                            $scope.allTags.push(filter);
                        });


                    },
                    //ERROR
                    function (data) {
                    });

            $scope.updateFilter = function () {
                var searchArray = $scope.search.replace(/\s+/g, ' ').split(' ');
                var allActive = $filter('filter')($scope.allTags, {isActive: true});
                $scope.criterias = [];
                angular.forEach(allActive, function (element) {
                    $scope.criterias.push(element.name);
                });

                if ($scope.search.length > 0) {
                    angular.forEach(searchArray, function (keyword) {
                        var i = $scope.criterias.indexOf(keyword);
                        if (i !== 0) {
                            $scope.criterias.push(keyword);
                        }
                    });
                }
            };


            $scope.showMore = function () {
                if ($scope.thereIsMore) {
                    $scope.projectLimit += 6;
                }
                $scope.thereIsMore = ($scope.portfolio.length > $scope.projectLimit);
            };


            $scope.addRemoveSearchCriteria = function (string) {
                // var j =  $scope.allTags.indexOf(string);
                if ($scope.criterias.indexOf(string) !== -1) {
                    var i = $scope.criterias.indexOf(string);
                    $scope.criterias.splice(i, 1);
                    $filter('filter')($scope.allTags, string)[0].isActive = false;
                }
                else {
                    $scope.criterias.push(string);
                    $filter('filter')($scope.allTags, string)[0].isActive = true;
                }
            };

            $scope.resetCriteria = function () {
                $scope.criterias = [];
                $scope.search = "";
                angular.forEach($scope.allTags, function (e) {
                    e.isActive = false;
                });
            };

            $scope.more = function(){
              updateLimit(true,6);
            };
            $scope.less = function(){
                $scope.tagLimit = $scope.tagInitialLimit;
            };
            $scope.closeFilter = function(){
                $scope.show = !$scope.show;
                var actives = $filter('orderBy')($filter('filter')($scope.allTags, {isActive : true}),"-occurence");
                var last = (actives.length > 0) ? actives[actives.length-1] : false;
                if(last !== false){
                    var i = $filter('orderBy')($scope.allTags,'-occurence').indexOf(last);
                    if(i+1 <= $scope.tagInitialLimit) $scope.less();
                    else{
                        $scope.tagLimit = i+1;
                    }
                }
                else $scope.less();

            };

            var updateLimit = function(add, step){
                if(add){
                    $scope.tagLimit = ($scope.tagLimit + step > $scope.allTags.length) ? $scope.allTags.length : $scope.tagLimit+step;
                }
                else{
                    $scope.tagLimit = ($scope.tagLimit - step < $scope.tagInitialLimit) ? $scope.tagInitialLimit : $scope.tagLimit-step;
                }
            };



            $scope.openInViewer = function(project){
                $scope.p = project;
                $scope.viewerOn = true;
            };

            $scope.closeViewer = function(){
                $scope.viewerOn = false;
                $scope.p = $scope.resetP;
            }


        }
    ])
;
/**
 * Created by Miloud on 21/12/2016.
 */

ctrl.controller('RoadmapCtrl', ['$scope',
    '$state',
    '$http', '$rootScope',
    function ($scope, $state, $http, $rootScope) {
        $scope.roadmaps = [];
        $rootScope.footer = 'Enchanté !';
        $http.get($rootScope.rootUrl + '/php/returnRoadmap.php')
            .then(
                //SUCCESS
                function (data) {
                    $scope.roadmaps = data.data;
                },
                //ERROR
                function (data) {
                });


    }]);