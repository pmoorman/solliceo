  Paperclip.interpolates :viewer_id do |attachment, style|
    "viewer_#{attachment.instance.viewer_id}"
  end