<li>
    <div class="form-check">
        <input class="form-check-input" type="radio" id="selectbox-radio-[{$sFieldName|default:"varselid"}]-[{$iKey}]-[{$oSelection->getValue()}]" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{$oSelection->getValue()}]" [{if $oSelection->isActive()}]checked[{/if}] data-selection-image="[{$oSelectionList->getSelectionImagePath($oSelection->getName())}]">
        <label class="form-check-label" for="selectbox-radio-[{$sFieldName|default:"varselid"}]-[{$iKey}]-[{$oSelection->getValue()}]">
            [{$oSelection->getName()}]
        </label>
    </div>
</li>