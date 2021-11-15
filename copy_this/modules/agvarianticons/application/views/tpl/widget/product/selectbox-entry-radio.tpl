<li>
    <div class="form-check">
        <input class="form-check-input" type="radio" id="selectbox-radio-[{$oSelectionList->getId()}]-[{$oSelection->getValue()}]" name="[{$sFieldName|default:"varselid"}][[{$iKey}]]" value="[{$oSelection->getValue()}]" [{if $oSelection->isActive()}]checked[{/if}] data-selection-image="[{$oSelectionList->getSelectionImagePath($oSelection->getName())}]">
        <label class="form-check-label" for="selectbox-radio-[{$oSelectionList->getId()}]-[{$oSelection->getValue()}]">
            [{$oSelection->getName()}]
        </label>
    </div>
</li>