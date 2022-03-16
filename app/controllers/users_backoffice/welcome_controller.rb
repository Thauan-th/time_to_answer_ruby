class UsersBackoffice::WelcomeController < UsersBackofficeController
   
    def index
        @total_questions = AdminStatistic.total_users
        @total_users = AdminStatistic.total_questions
    end
end
