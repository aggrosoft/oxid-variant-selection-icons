<?php

$sMetadataVersion = '1.1';

$aModule = array(
    'id'           => 'agvarianticons',
    'title'        => 'Varianten Icons',
    'description'  => 'Erlaubt die Anzeige von Icons für Varianten in Auswahllisten',
    'version'      => '2.1.0',
    'author'       => 'Aggrosoft GmbH',
    'url'		   => 'http://www.ecomponents.de',
    'files'       => array(
        'agvarianticons_installer' => 'agvarianticons/application/core/agvarianticons_installer.php'
    ),
    'extend'      => array(
        'oxvarianthandler' => 'agvarianticons/extensions/agvarianticons_oxvarianthandler',
        'oxvariantselectlist' => 'agvarianticons/extensions/agvarianticons_oxvariantselectlist',
        'oxselectlist' => 'agvarianticons/extensions/agvarianticons_oxselectlist',
        'oxsimplevariant' => 'agvarianticons/extensions/agvarianticons_oxsimplevariant',
        'oxselection' => 'agvarianticons/extensions/agvarianticons_oxselection',
        'oxarticle' => 'agvarianticons/extensions/agvarianticons_oxarticle'
    ),
    'templates'   => array(
        'page/details/inc/selectlists.tpl' => 'agvarianticons/application/views/tpl/page/details/inc/selectlists.tpl',
        'page/details/inc/variantselections.tpl' => 'agvarianticons/application/views/tpl/page/details/inc/variantselections.tpl',
        'widget/product/selectbox-button.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-button.tpl',
        'widget/product/selectbox-icon.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-icon.tpl',
        'widget/product/selectbox-image.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-image.tpl',
        'widget/product/selectbox-radio.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-radio.tpl',
        'widget/product/selectbox-color.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-color.tpl',
        'widget/product/selectbox-select.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-select.tpl',
        'widget/product/selectbox-entry-button.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-entry-button.tpl',
        'widget/product/selectbox-entry-radio.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-entry-radio.tpl',
        'widget/product/selectbox-entry-color.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-entry-color.tpl',
        'widget/product/selectbox-entry-icon.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-entry-icon.tpl',
        'widget/product/selectbox-entry-image.tpl' => 'agvarianticons/application/views/tpl/widget/product/selectbox-entry-image.tpl'
    ),
    'events'       => array(
        'onActivate'   => 'agvarianticons_installer::onActivate',
    ),
    'settings' => array(
        array('group' => 'agvarianticons_settings', 'name' => 'blHidePriceText', 'type' => 'bool',   'value' => false),
        array('group' => 'agvarianticons_main', 'name' => 'aIconSelections', 'type' => 'arr',   'value' => ''),
        array('group' => 'agvarianticons_btn', 'name' => 'aButtonSelections', 'type' => 'arr',   'value' => ''),
        array('group' => 'agvarianticons_radio', 'name' => 'aRadioSelections', 'type' => 'arr',   'value' => ''),
        array('group' => 'agvarianticons_color', 'name' => 'aColorSelections', 'type' => 'arr',   'value' => ''),
        array('group' => 'agvarianticons_image', 'name' => 'aImageSelections', 'type' => 'arr',   'value' => ''),
        array('group' => 'agvarianticons_maps', 'name' => 'aColorMap', 'type' => 'aarr',   'value' => array()),
        array('group' => 'agvarianticons_maps', 'name' => 'aImageMap', 'type' => 'aarr',   'value' => array()),
        array('group' => 'agvarianticons_maps', 'name' => 'aCustomSelections', 'type' => 'aarr',   'value' => array())
    ),
    'blocks' => array(
        array('template' => 'page/details/inc/productmain.tpl','block'=>'details_productmain_selectlists','file'=>'/views/blocks/details_productmain_selectlists.tpl'),
        array('template' => 'page/details/inc/productmain.tpl','block'=>'details_productmain_variantselections','file'=>'/views/blocks/details_productmain_variantselections.tpl'),
        array('template' => 'selectlist_main.tpl','block'=>'admin_selectlist_main_form','file'=>'/views/blocks/admin_selectlist_main_form.tpl'),
        array('template' => 'article_extend.tpl','block'=>'admin_article_extend_form','file'=>'/views/blocks/admin_article_extend_form.tpl')
    )
);
?>
