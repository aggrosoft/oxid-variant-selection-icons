[{assign var="oSelections" value=$oSelectionList->getSelections()}]

[{if $oSelections}]
    <div class="form-group dropDown">
        [{if !$blHideLabel}]
        <p class="variant-label"><strong>[{$oSelectionList->getLabel()}][{oxmultilang ident="COLON"}]</strong></p>
        [{/if}]
        <div class="dropdown">
            [{if $editable === false}]
            <button type="button" class="btn btn-outline-dark btn-sm dropdown-toggle" data-toggle="dropdown">
                [{assign var="oActiveSelection" value=$oSelectionList->getActiveSelection()}]
                [{if $oActiveSelection}]
                <span class="float-left">[{$oActiveSelection->getName()}]</span>
                [{elseif !$blHideDefault}]
                <span class="float-left">
                        [{if $sFieldName == "sel"}]
                            [{oxmultilang ident="PLEASE_CHOOSE"}]
                        [{else}]
                            [{$oSelectionList->getLabel()}] [{oxmultilang ident="CHOOSE_VARIANT"}]
                        [{/if}]
                    </span>
                [{/if}]
            </button>
            [{/if}]
            [{if $editable !== false}]
        <input type="hidden" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{if $oActiveSelection}][{$oActiveSelection->getValue()}][{/if}]">
            <ul class="dropdown-menu list-inline [{$sJsAction}][{if $sFieldName != "sel"}] vardrop[{/if}] d-block position-relative w-100 border-0" role="menu" style="z-index:0">
                [{foreach from=$oSelections item=oSelection}]
                <li class="[{if $oSelection->isDisabled()}] disabled js-disabled[{/if}] list-inline-item">
                    <a href="[{$oSelection->getLink()}]" data-selection-id="[{$oSelection->getValue()}]" class="btn [{if $oSelection->isActive()}] btn-outline-primary[{else}]btn-outline-light[{/if}]">
                        <img src="[{$oSelection->getIcon()}]" alt="[{$oSelection->getName()}]" title="[{$oSelection->getName()}]" class="img-fluid variantlisticon" />
                    </a>
                </li>
                [{/foreach}]
            </ul>
            [{/if}]
        </div>
    </div>
    [{/if}]