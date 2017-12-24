function update(self) {
    self = $(self);
    var id = self.val();
    var isSubCategory = self.attr('name') !== 'category';
    var state = self[0].checked;
    var selector = id;
    if (!isSubCategory) {
        selector = 'sub-' + id;
    }
    $('.' + selector).each(function () {
        var item = this;
        if (state) {
            item.checked = true;
        } else {
            item.checked = false;
        }
        $(item).change();
    });
}