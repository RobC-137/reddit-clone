class ApplicationCell < Cell::ViewModel
    def current_user
        context[:controller].current_user
    end
end