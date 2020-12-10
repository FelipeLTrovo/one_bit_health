module ApplicationHelper
  def display_flash_messages_devise
    if self.try(:resource)
      if flash.any?
        messages = flash.map do |type, message|
          classes = "alert alert-notify alert-"
          classes << get_type_notify(type)
          content_tag(:div, message, class: classes)
        end.join
      elsif resource.errors.any?
        message = resource.errors.full_messages.to_sentence
        messages = content_tag(:div, message, class: "alert alert-notify alert-danger")
      end

      messages.html_safe if messages
    end
  end

  def display_flash_messages
    if flash.any?
      messages = flash.map do |type, message|
        classes = "alert alert-notify alert-"
        classes << get_type_notify(type)
        content_tag(:div, message, class: classes)
      end.join
    end

    messages.html_safe if messages
  end

  def get_type_notify(type)
    case type
    when "notice"
      return "success fa fa-check-circle"
    when "success"
      return "success fa fa-check-circle"
    when "alert"
      return "warning fa fa-exclamation-triangle"
    when "error"
      return "danger fa fa-times-circle"
    else
      return "info fa fa-info-circle"
    end
  end
end
