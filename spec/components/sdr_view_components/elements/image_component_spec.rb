# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SdrViewComponents::Elements::ImageComponent, type: :component do
  it 'renders an image tag' do
    render_inline(described_class.new(src: 'path/to/image.jpg', alt: 'Image description'))
    expect(page).to have_css('img[src="path/to/image.jpg"][alt="Image description"]')
  end

  context 'with classes' do
    it 'renders the image with classes' do
      render_inline(described_class.new(src: 'path/to/image.jpg', alt: 'Image description', classes: 'thumbnail'))
      expect(page).to have_css('img.thumbnail[src="path/to/image.jpg"][alt="Image description"]')
    end
  end

  context 'with alt text is not provided' do
    it 'raises an ArgumentError' do
      expect do
        render_inline(described_class.new(src: 'path/to/image.jpg', alt: nil, classes: 'thumbnail'))
      end.to raise_error(ArgumentError)
    end
  end
end
