<li>
    <div class="form-check [{if $oSelection->isDisabled()}]disabled[{/if}]">
        <input class="form-check-input" type="radio" id="selectbox-radio-[{$sFieldName|default:"varselid"}]-[{$iKey}]-[{$oSelection->getValue()}]" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{$oSelection->getValue()}]" [{if $oSelection->isActive()}]checked[{/if}] [{if $oSelection->isDisabled()}]disabled[{/if}] data-selection-image="[{$oSelectionList->getSelectionImagePath($oSelection->getName())}]" data-selection-name="[{$oSelection->getName()}]">
        <label class="form-check-label" for="selectbox-radio-[{$sFieldName|default:"varselid"}]-[{$iKey}]-[{$oSelection->getValue()}]">
            [{$oSelection->getName()}]
        </label>
    </div>
</li>