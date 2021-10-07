class CovidsController < ApplicationController
    def show
        @total_cases = 0
        @new_cases = 0
        @total_deaths = 0
        @new_deaths = 0
        @total_recoveries = 0
        @new_recoveries = 0
        @total_injections = 0
        @new_injections = 0
        @nation = params[:nation]
        @covids = Covid.all
        @covids.each do |covid|
            if covid.nation == @nation
                @total_cases += covid.new_cases
                @total_deaths += covid.new_deaths
                @total_recoveries += covid.new_recoveries
                @total_injections += covid.new_injections
                if covid.created_at >= Time.now.beginning_of_day
                    @new_cases += covid.new_cases
                    @new_deaths += covid.new_deaths
                    @new_recoveries += covid.new_recoveries
                    @new_injections += covid.new_injections
                end
            end
        end
        render "show", status: :ok
    end

    def create
        @covid = Covid.new(covid_params)
        if @covid.save
            render json: {"message": "Add information covid today successed"}, status: :ok
        else
            render json: @covid.errors, status: :unprocessable_entity
        end
    end

    private
    def covid_params
        params.require(:covid).permit(:nation, :new_cases, :new_deaths, :new_recoveries, :new_injections)
    end
end
