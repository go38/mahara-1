{if $RIGHTNAV}
        <div id="right-nav">
            <ul>{strip}
{foreach from=$RIGHTNAV item=item}
                <li{if $item.selected}{assign var=MAINNAVSELECTED value=$item} class="selected"{/if}><a href="{if $item.wwwroot}{$item.wwwroot}{else}{$WWWROOT}{/if}{$item.url}">{if $item.title}{$item.title}{/if}{if $item.icon}<img src="{$item.icon}" alt="{$item.alt}">{if isset($item.count)}<span class="navcount{if $item.countclass} {$item.countclass}{/if}">{$item.count}</span>{/if}</a></li>
{/foreach}
                <li><a href="{$WWWROOT}?logout" accesskey="l">{str tag="logout"}</a></li>
            {/strip}</ul>
        </div>
{/if}

{if $MAINNAV}
        <div id="main-nav">
            <ul>{strip}
{foreach from=$MAINNAV item=item}
                <li{if $item.selected}{assign var=MAINNAVSELECTED value=$item} class="selected"{/if}><a href="{$WWWROOT}{$item.url}"{if $item.accesskey} accesskey="{$item.accesskey}"{/if}>{$item.title}</a></li>
{/foreach}
{if $ADMIN || $INSTITUTIONALADMIN}
                <li><a href="{$WWWROOT}" accesskey="h">{str tag="returntosite"}</a></li>
{elseif $USER->get('admin')}
                <li><a href="{$WWWROOT}admin/" accesskey="a">{str tag="siteadministration"}</a></li>
{elseif $USER->is_institutional_admin()}
                <li><a href="{$WWWROOT}admin/users/search.php" accesskey="a">{str tag="useradministration"}</a></li>
{/if}
            {/strip}</ul>
        </div>

        <div id="sub-nav">
{if $MAINNAVSELECTED.submenu}
            <ul>{strip}
{foreach from=$MAINNAVSELECTED.submenu item=item}
                <li{if $item.selected} class="selected"{/if}><a href="{if get_config('httpswwwroot') && $item.url=='account/'}{$HTTPSWWWROOT}{else}{$WWWROOT}{/if}{$item.url}"{if $item.accesskey} accesskey="{$item.accesskey}"{/if}>{$item.title}</a></li>
{/foreach}
            {/strip}</ul>
{/if}
        </div>
{/if}