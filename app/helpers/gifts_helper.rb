module GiftsHelper
  EMOJIS = {
    tech: "💻",
    blu_ray_4k: "📀",
    blu_ray: "🎞️",
    dvd: "📀",
    books: "📚",
    comics: "📖",
    video_games: "🎮",
    fashion: "👗",
    hobbies: "🎨",
    home: "🏠",
    beauty: "💄",
    music: "🎵",
    sports: "⚽",
    travel: "✈️",
    experience: "🎟️",
    food: "🍽️",
    decor: "🖼️"
  }

  # usage: emoji_label(:tech, position: :before) => "💻 Technologie"
  #        emoji_label(:tech, position: :after) => "Technologie 💻"
  def emoji_label(tag, position: :before)
    text = I18n.t("gift.tags.#{tag}")
    emoji = EMOJIS[tag.to_sym] || ""
    position == :before ? "#{emoji} #{text}" : "#{text} #{emoji}"
  end

  def gift_image(gift, width: 50, height:50, css_class: "rounded-circle")
    if gift.photo.present?
      cl_image_tag(gift.photo.key, width: width, class: css_class)
    else
      image_tag("defaults/no_photo.jpg", width: width, class: css_class)
    end
  end

  def gift_image_url(gift)
    if gift.photo.present?
      cl_image_path(gift.photo.key)
    else
      image_tag("defaults/no_photo.jpg", width: width, class: css_class)
    end
  end
end
