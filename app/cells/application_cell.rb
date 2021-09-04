class ApplicationCell < Cell::ViewModel
    include ActionView::Helpers::DateHelper
    def current_user
        context[:controller].current_user
    end
end