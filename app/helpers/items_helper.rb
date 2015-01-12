module ItemsHelper
  def predefined_list_with_labels(name)
    predefined_item_list(name).map {|key|
      [predefined_list_label(name, key), key]
    }
  end

  def predefined_item_list(name)
    Item.const_get(name.upcase)
  end

  def predefined_list_label(list, key)
    prefix = list.to_s.pluralize
    t("#{prefix}.#{key}")
  end
end
