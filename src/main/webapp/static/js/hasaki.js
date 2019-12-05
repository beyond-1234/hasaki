$('#submit').click(function () {
    $.post(
        "/hasaki_war_exploded/login", {
            username: $('#username').val(),
            password: $('#password').val()
        }, function (data) {
            if (!data.search("登录成功")) {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data,
                    buttons: {
                        ok: function () {
                            window.location.reload();
                        }
                    }
                })
            } else {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data
                })
            }

        }
    )
});
function checkTitle() {
    if(document.getElementById("title").value===""){
        $.confirm({
            theme: 'black',
            title: '提示',
            content: '请写标题鸭～'
        });
        return false;
    }
    return true;
}
//submit the topic
$('#upload').click(function () {
    if (checkTitle()) {
        $.post(
            '/hasaki_war_exploded/forum/write', {
                title: $('#title').val(),
                content: $('#markdown').val(),
                tag_id: $('#tag').val()
            }, function (data) {
                $.confirm({
                    theme: 'black',
                    title: '返回信息',
                    content: data
                })
            }
        )
    }
});
