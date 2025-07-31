module UsersHelper
  def user_avatar_image(user, width: 50, height:50, css_class: "rounded-circle")
    if user.avatar.present?
      cl_image_tag(user.avatar.key, width: width, class: css_class)
    else
      image_tag("avatars/default.png", width: width, class: css_class)
    end
  end
end
