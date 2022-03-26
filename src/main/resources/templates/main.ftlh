<#import "parts/common.ftlh" as c>

<@c.page>
    <div class="form-row">
        <div class="form-group col-md-6">
            <form method="get" action="/main">
                <div class="row">
                    <div class="col">
                        <input type="text" name="filter" class="form-control" value="${filter?ifExists}" placeholder="Search by tag">
                    </div>
                    <div class="col">
                        <button type="submit" class="btn btn-primary">Search</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
    <a class="btn btn-primary mt-3" data-bs-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new Message
    </a>
    <div class="collapse mt-3" id="collapseExample">
        <div class="form-group">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group mt-3">
                    <input type="text" class="form-control" name="text" placeholder="Введите сообщение"/>
                </div>
                <div class="form-group mt-3">
                    <input type="text" class="form-control" name="tag" placeholder="Введите тэг"/>
                </div>
                <div class="form-group mt-3">
                    <div class="mb-3">
                        <input type="file" name="file" id="formFile">
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <div class="form-group mt-3">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>
    <div class="row row-cols-1 row-cols-md-4 g-4">
        <#list messages as message>
            <div class="col">
                <div class="card my-3" style="width: 18rem;">
                    <div>
                        <#if message.filename??>
                            <img src="/img/${message.filename}" class="card-img-top">
                        </#if>
                    </div>
                    <div class="m-2">
                        <span>${message.text}</span>
                        <i>${message.tag}</i>
                    </div>
                    <div class="card-footer text-muted">
                        ${message.author.getUsername()}
                    </div>
                </div>
            </div>
        <#else>
            No messages
        </#list>
    </div>
</@c.page>