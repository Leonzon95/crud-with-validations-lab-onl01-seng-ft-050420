class ReleaseYearValidator < ActiveModel::Validator
    def validate(record)
        if record.released && record.release_year.blank?
            record.errors[:release_year] << "must have a release year if song is released"
        elsif record.release_year
            if record.release_year > Time.zone.now.year
                record.errors[:release_year] << "must not be in future"
            end
        end
    end
end