{if $adminAction == 'install'}
    <span class="msg_success"><span class="icon-ok-circled"></span> {$install_template|string_format:"{$CONST.TEMPLATE_SET}"}</span>
{/if}
{if $deprecated}
    <span class="msg_notice"><span class="icon-info-circled"></span> {$CONST.WARNING_TEMPLATE_DEPRECATED}</span>
{/if}

{if $adminAction == 'editConfiguration'}
    <section id="template_options">
        <h2>{$CONST.STYLE_OPTIONS} ({$cur_template})</h2>
    {if $has_config}
        {if $adminAction == 'configure'}
        <span class="msg_success"><span class="icon-ok-circled"></span> {$CONST.DONE}: {$save_time}</span>
        {/if}
        <form class="theme_options option_list" method="post" action="serendipity_admin.php">
            <input name="serendipity[adminModule]" type="hidden" value="templates">
            <input name="serendipity[adminAction]" type="hidden" value="configure">
            {$form_token}
            {$configuration}
        </form>
    {else}
        <p>{$CONST.STYLE_OPTIONS_NONE}</p>
    {/if}
    </section>
    <script src="{serendipity_getFile file='admin/js/jquery.magnific-popup.js'}"></script>
{else}
    <section id="template_select" class="clearfix">
        {assign var="cur_tpl" value=$templates[$cur_template]}
        <h2>{$CONST.CURRENT_TEMPLATE}</h2>

        <article class="clearfix current_template">
            <h3>{$CONST.FRONTEND}: {$cur_tpl.info.name}</h3>

            <div class="clearfix equal_heights template_wrap">
                <div class="template_preview">
                {if $cur_tpl.fullsize_preview || $cur_tpl.preview}
                    {if $cur_tpl.fullsize_preview}
                        <a class="media_fullsize" href="{$cur_tpl.fullsize_preview}" title="{$CONST.MEDIA_FULLSIZE}: {$cur_tpl.info.name}">
                            <img src="{$cur_tpl.fullsize_preview}" class="template_preview_img" alt="{$CONST.PREVIEW}" >
                        </a>
                    {else}
                        <img src="{$cur_tpl.preview}" alt="{$CONST.PREVIEW}" >
                    {/if}
                {/if}
                    <footer id="template_info_cur" class="template_info additional_info">
                        <dl class="clearfix">
                            <dt class="template_author">{$CONST.AUTHOR}:</dt>
                            <dd>{$cur_tpl.info.author}</dd>
                            <dt class="template_date">{$CONST.LAST_UPDATED}:</dt>
                            <dd>{$cur_tpl.info.date}</dd>
                            <dt class="template_admin">{$CONST.CUSTOM_ADMIN_INTERFACE}:</dt>
                            <dd>{$cur_tpl.info.custom_admin_interface}</dd>
                        </dl>
                    </footer>
                </div>
            </div>

            <button class="template_show_info button_link" type="button" data-href="#template_info_cur" title="{$CONST.TEMPLATE_INFO}"><span class="icon-info-circled"></span><span class="visuallyhidden"> {$CONST.TEMPLATE_INFO}</span></button>

            <a class="button_link" href="?serendipity[adminModule]=templates&amp;serendipity[adminAction]=editConfiguration" title="{$CONST.CONFIGURATION}">{$CONST.CONFIGURATION}</a>
        </article>

        {if $cur_template_backend}
            {assign var="cur_tpl_backend" value=$templates[$cur_template_backend]}
            <article class="clearfix current_template even">
                <h3>{$CONST.BACKEND}: {$cur_tpl_backend.info.name}</h3>

                <div class="clearfix equal_heights template_wrap">
                    <div class="template_preview">
                    {if $cur_tpl_backend.fullsize_preview || $cur_tpl_backend.preview}
                        {if $cur_tpl_backend.fullsize_preview}
                            <a class="media_fullsize" href="{$cur_tpl_backend.fullsize_preview}" title="{$CONST.MEDIA_FULLSIZE}: {$cur_tpl_backend.info.name}">
                                <img src="{$cur_tpl_backend.fullsize_preview}" class="template_preview_img" alt="{$CONST.PREVIEW}" >
                            </a>
                        {else}
                            <img src="{$cur_tpl_backend.preview}" alt="{$CONST.PREVIEW}" >
                        {/if}
                    {/if}
                        <footer id="template_info_cur_backend" class="template_info additional_info">
                            <dl class="clearfix">
                                <dt class="template_author">{$CONST.AUTHOR}:</dt>
                                <dd>{$cur_tpl_backend.info.author}</dd>
                                <dt class="template_date">{$CONST.LAST_UPDATED}:</dt>
                                <dd>{$cur_tpl_backend.info.date}</dd>
                            </dl>
                        </footer>
                    </div>
                </div>

                <button class="template_show_info button_link" type="button" data-href="#template_info_cur_backend" title="{$CONST.TEMPLATE_INFO}"><span class="icon-info-circled"></span><span class="visuallyhidden"> {$CONST.TEMPLATE_INFO}</span></button>
            </article>
        {/if}

        <h2>{$CONST.AVAILABLE_TEMPLATES}</h2>

        <ul class="plainList clearfix">
        {foreach $templates as $template=>$info}
            {if !empty($template) && $info.info.engine != 'yes'}
            <li><article class="clearfix {cycle values="odd,even"}">
                    <h3>{$info.info.name}</h3>
                    <div class="clearfix equal_heights template_wrap">
                        <div class="template_preview">
                        {if $info.fullsize_preview || $info.preview}
                            {if $info.fullsize_preview}
                                <a class="media_fullsize" href="{$info.fullsize_preview}" title="{$CONST.MEDIA_FULLSIZE}: {$info.info.name}">
                                    <img src="{$info.fullsize_preview}" class="template_preview_img" alt="{$CONST.PREVIEW}" >
                                </a>
                            {else}
                                <img src="{$info.preview}" alt="{$CONST.PREVIEW}" >
                            {/if}
                        {/if}
                            <footer id="template_info_{$info@key}" class="template_info additional_info">
                                <dl class="clearfix">
                                    <dt class="template_author">{$CONST.AUTHOR}:</dt>
                                    <dd>{$info.info.author}</dd>
                                    <dt class="template_date">{$CONST.LAST_UPDATED}:</dt>
                                    <dd>{$info.info.date}</dd>
                                    <dt class="template_admin">{$CONST.CUSTOM_ADMIN_INTERFACE}:</dt>
                                    <dd>{if $info.info.custom_admin_interface} {$info.info.custom_admin_interface} {else} {$CONST.NO} {/if}</dd>
                                </dl>
                            </footer>
                        </div>
                    </div>

                    <button class="template_show_info button_link" type="button" data-href="#template_info_{$info@key}" title="{$CONST.TEMPLATE_INFO}"><span class="icon-info-circled"></span><span class="visuallyhidden"> {$CONST.TEMPLATE_INFO}</span></button>

                {if !$info.unmetRequirements}
                    {if $info.info.custom_admin_interface == $CONST.YES}
                    <a class="button_link" href="?serendipity[adminModule]=templates&amp;serendipity[adminAction]=install-frontend&amp;serendipity[theme]={$template}{$info.info.customURI}" title="{$CONST.SET_AS_TEMPLATE}">{$CONST.INSTALL}: {$CONST.FRONTEND}</a>
                    <a class="button_link" href="?serendipity[adminModule]=templates&amp;serendipity[adminAction]=install-backend&amp;serendipity[theme]={$template}{$info.info.customURI}" title="{$CONST.SET_AS_TEMPLATE}">{$CONST.INSTALL}: {$CONST.BACKEND}</a>
                    {else}
                    <a class="button_link" href="?serendipity[adminModule]=templates&amp;serendipity[adminAction]=install&amp;serendipity[theme]={$template}{$info.info.customURI}" title="{$CONST.SET_AS_TEMPLATE}">{$CONST.INSTALL}: {$CONST.FRONTEND}</a>
                    {/if}
                {else}
                    <span class="unmet_requirements msg_error"><span class="icon-attention-circled"></span> {$info.unmetRequirements}></span>
                {/if}
                </article>
            </li>
            {/if}
        {/foreach}
        </ul>
    </section>

    <script src="{serendipity_getFile file='admin/js/jquery.syncheight.js'}"></script>
    <script src="{serendipity_getFile file='admin/js/jquery.magnific-popup.js'}"></script>
{/if}
