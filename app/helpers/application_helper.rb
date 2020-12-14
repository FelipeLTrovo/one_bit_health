module ApplicationHelper
  def display_flash_messages_devise
    if self.try(:resource)
      if flash.any?
        messages = flash.map do |type, message|
          classes = "alert alert-auto-close alert-notify alert-"
          classes << get_type_notify(type)
          content_tag(:div, message, class: classes)
        end.join
      elsif resource.errors.any?
        message = resource.errors.full_messages.to_sentence
        messages = content_tag(:div, message, class: "alert alert-notify alert-danger alert-auto-close")
      end

      messages.html_safe if messages
    end
  end

  def display_flash_messages
    if flash.any?
      messages = flash.map do |type, message|
        classes = "alert alert-auto-close alert-notify alert-"
        classes << get_type_notify(type)
        content_tag(:div, message, class: classes)
      end.join
    end

    messages.html_safe if messages
  end

  def display_flash_messages_object(object)
    message = object.errors.full_messages.to_sentence
    if message.present?
      messages = content_tag(:div, message, class: "alert alert-notify alert-danger alert-auto-close")
      messages.html_safe
    end
  end

  def get_type_notify(type)
    case type
    when "notice"
      return "success"
    when "success"
      return "success"
    when "alert"
      return "warning"
    when "error"
      return "danger"
    else
      return "info"
    end
  end
  def date_format(date)
    date.strftime("%d/%m/%Y - %Hh%M")
  end
  def date_format_short(date)
    date.strftime("%d/%m/%Y")
  end
end
