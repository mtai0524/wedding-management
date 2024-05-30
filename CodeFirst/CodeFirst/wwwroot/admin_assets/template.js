if (typeof jQuery === "undefined") {
    throw new Error("jQuery plugins need to be before this file");
}

$(function () {
    "use strict";

    // main sidebar toggle js
    $('.menu-toggle').on('click', function () {
        $('.sidebar').toggleClass('open');
        $('.open').removeClass('sidebar-mini');
    });

    // layout a sidebar mini version
    $('.sidebar-mini-btn').on('click', function () {
        $('.sidebar').toggleClass('sidebar-mini');
        $('.sidebar-mini').removeClass('open');
    });

    // chat page chatlist toggle js
    $('.chatlist-toggle').on('click', function () {
        $('.card-chat').toggleClass('open');
    });

    $(".theme-rtl input").on('change', function () {
        if (this.checked) {
            $("body").addClass('rtl_mode');
        } else {
            $("body").removeClass('rtl_mode');
        }

    });

    // cSidebar overflow daynamic height

    overFlowDynamic();

    $(window).resize(function () {
        overFlowDynamic();
    });

    function overFlowDynamic() {
        var sideheight = $(".sidebar.sidebar-mini").height() + 48;

        if (sideheight <= 760) {
            $(".sidebar.sidebar-mini").css("overflow", "scroll");
        }
        else {
            $(".sidebar.sidebar-mini").css("overflow", "visible");
        }
    }


    // Dropdown scroll hide using table responsive

    $('.table-responsive').on('show.bs.dropdown', function () {
        $('.table-responsive').css("overflow", "inherit");
    });

    $('.table-responsive').on('hide.bs.dropdown', function () {
        $('.table-responsive').css("overflow", "auto");
    })

    // light and dark theme setting js
    var toggleSwitch = document.querySelector('.theme-switch input[type="checkbox"]');
    var toggleHcSwitch = document.querySelector('.theme-high-contrast input[type="checkbox"]');
    var currentTheme = localStorage.getItem('theme');
    if (currentTheme) {
        document.documentElement.setAttribute('data-theme', currentTheme);

        if (currentTheme === 'dark') {
            toggleSwitch.checked = true;
        }
        if (currentTheme === 'high-contrast') {
            toggleHcSwitch.checked = true;
            toggleSwitch.checked = false;
        }
    }
    function switchTheme(e) {
        if (e.target.checked) {
            document.documentElement.setAttribute('data-theme', 'dark');
            localStorage.setItem('theme', 'dark');
            $('.theme-high-contrast input[type="checkbox"]').prop("checked", false);
        }
        else {
            document.documentElement.setAttribute('data-theme', 'light');
            localStorage.setItem('theme', 'light');
        }
    }
    toggleSwitch.addEventListener('change', switchTheme, false);
    // end
});

//// live support team js
//var Tawk_API = Tawk_API || {}, Tawk_LoadStart = new Date();
//(function () {
//    var s1 = document.createElement("script"), s0 = document.getElementsByTagName("script")[0];
//    s1.async = true;
//    s1.src = 'https://embed.tawk.to/654a847da84dd54dc489870d/1helhb2rj';
//    s1.charset = 'UTF-8';
//    s1.setAttribute('crossorigin', '*');
//    s0.parentNode.insertBefore(s1, s0);
//})();

//<script>
//    window.__lc = window.__lc || {};
//    window.__lc.license = 18027936;
//    window.__lc.integration_name = "manual_onboarding";
//    ;(function(n,t,c){function i(n){return e._h?e._h.apply(null,n):e._q.push(n)}var e={_q:[],_h:null,_v:"2.0",on:function(){i(["on",c.call(arguments)])},once:function(){i(["once",c.call(arguments)])},off:function(){i(["off",c.call(arguments)])},get:function(){if(!e._h)throw new Error("[LiveChatWidget] You can't use getters before load.");return i(["get",c.call(arguments)])},call:function(){i(["call",c.call(arguments)])},init:function(){var n=t.createElement("script");n.async=!0,n.type="text/javascript",n.src="https://cdn.livechatinc.com/tracking.js",t.head.appendChild(n)}};!n.__lc.asyncInit&&e.init(),n.LiveChatWidget=n.LiveChatWidget||e}(window,document,[].slice))
//</script>
//<noscript><a href="https://www.livechat.com/chat-with/18027936/" rel="nofollow">Chat with us</a>, powered by <a href="https://www.livechat.com/?welcome" rel="noopener nofollow" target="_blank">LiveChat</a></noscript>



