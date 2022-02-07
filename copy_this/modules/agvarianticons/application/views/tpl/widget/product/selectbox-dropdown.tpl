[{assign var="oSelections" value=$oSelectionList->getSelections()}]
[{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
[{if $oSelections}]
<div class="form-group selectbox-select">
    [{if $editable === false}]
    [{if !$blHideLabel}]
    <p class="variant-label"><strong>[{$oSelectionList->getLabel()}][{oxmultilang ident="COLON"}]</strong></p>
    [{/if}]
    [{if $oActiveSelection}]
    <span class="float-left">[{$oActiveSelection->getName()}]</span>
    [{/if}]
    [{else}]
    <div class="dropdown">
        <button class="btn dropdown-toggle w-100 text-left btn-outline-dark" type="button" data-toggle="dropdown" aria-expanded="false">
            <strong>[{$oSelectionList->getLabel()}][{oxmultilang ident="COLON"}]</strong> [{if $oActiveSelection}][{$oActiveSelection->getName()}][{else}][{oxmultilang ident="PLEASE_CHOOSE"}][{/if}]
        </button>
        <div class="dropdown-menu" data-toggle="buttons">
            [{foreach from=$oSelections item=oSelection}]
            <label class="btn btn-link w-100 text-left[{if $oSelection->isActive()}] active[{/if}]">
                <input class="d-none" type="radio" value="[{$oSelection->getValue()}]" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" [{if $oSelection->isActive()}]checked[{/if}]> [{$oSelection->getName()}]
            </label>
            [{/foreach}]
        </div>
    </div>
    [{/if}]
</div>
[{/if}]