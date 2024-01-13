module ApplicationHelper
  def flash_class(message_type)
    case message_type
    when 'notice'
      'bg-green-100 text-green-800'
    when 'alert'
      'bg-yellow-100 text-yellow-800'
    when 'error'
      'bg-red-100 text-red-800'
    when 'success'
      'bg-blue-100 text-blue-800'
    else
      'bg-gray-100 text-gray-800'
    end
  end
end
