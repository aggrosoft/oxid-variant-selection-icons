[{if $aVariantSelections && $aVariantSelections.selections}]
    [{oxscript include="js/widgets/oxajax.min.js" priority=10 }]
    [{oxscript include="js/widgets/oxarticlevariant.min.js" priority=10 }]
    [{oxscript add="$( '#variants' ).oxArticleVariant();"}]
    [{assign var="blCanBuy" value=$aVariantSelections.blPerfectFit}]
    [{if !$blHasActiveSelections}]
        [{if !$blCanBuy && !$oDetailsProduct->isParentNotBuyable()}]
            [{assign var="blCanBuy" value=true}]
        [{/if}]
    [{/if}]
    <div id="variants" class="selectorsBox variant-dropdown js-fnSubmit">
        [{assign var="blHasActiveSelections" value=false}]
        [{foreach from=$aVariantSelections.selections item=oList key=iKey}]
            [{if $oList->getActiveSelection()}]
                [{assign var="blHasActiveSelections" value=true}]
            [{/if}]
            [{assign var=sDisplayType value=$oList->getVariantIconDisplayType()}]
            [{assign var=sDisplayTemplate value="widget/product/selectbox-"|cat:$sDisplayType|cat:'.tpl'}]
            [{if $sDisplayType }]
                [{include file=$sDisplayTemplate oSelectionList=$oList iKey=$iKey blInDetails=true sDisplayType=$sDisplayType}]
            [{else}]
                [{include file="widget/product/selectbox.tpl" oSelectionList=$oList iKey=$iKey blInDetails=true}]
            [{/if}]

        [{/foreach}]

        [{capture assign="variantScript"}]
            $(function(){
                $('#variants :input').change(function () {
                    var form = $('form.js-oxWidgetReload');
                    var data = form.serialize() + "&" + $('#variants :input').serialize();

                    $.ajax({
                        url: form.attr('action'),
                        data: data,
                        success: function (result) {
                            $('#details_container').replaceWith($(result));
                        }
                    })
                });
            });
        [{/capture}]
        [{oxscript add=$variantScript}]

    </div>
[{/if}]