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
end
