Ext.Loader.setConfig({
    enabled: true
});

Ext.define("flybox.store.FE_DeprisaStore", {
    extend: "Ext.data.Store",
    object: "",
    proxy: {
        type: "ajax",
        url: "/Terminos.aspx",
        extraParams: {
            object: ""
        },
        reader: {
            type: "json",
            root: "data",
            successProperty: "success"
        }
    },
    constructor: function (e) {
        e = Ext.apply({
            proxy: {
                extraParams: {
                    object: e.object,
                    start: 0,
                    limit: 1e3
                }
            }
        }, e);
        this.callParent([e])
    }
});

Ext.create("flybox.store.FE_DeprisaStore", {
    storeId: "Store_terminos",
    //model: "flybox.model.State",
    object: "terminos_pais"
});

var t = new Ext.LoadMask(e, {
    msg: "cargando"
});
t.show();
Ext.getStore("FE_TypeLocker").load({
    callback: function () { }

});