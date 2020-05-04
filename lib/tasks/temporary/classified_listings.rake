namespace :temporary do
  namespace :classified_listings do
    desc "Backfill social preview info for classified listings categories"
    task backfill_social_preview_info: :environment do
      info = {
        "collabs": ["Collaborators Wanted", "#5AE8D9"],
        "cfp": ["Call For Proposal", "#f58f8d"],
        "forhire": ["Available For Hire", "#b78cf4"],
        "education": ["Education", "#5AABE8"],
        "jobs": ["Now Hiring", "#53c3ad"],
        "mentors": ["Offering Mentorship", "#A69EE8"],
        "mentees": ["Looking For Mentorship", "#88aedb"],
        "forsale": ["Stuff For Sale", "#d0adfb"],
        "events": ["Upcoming Event", "#f8b3d0"],
        "misc": ["Miscellaneous", "#6393FF"],
        "products": ["Products & Tools", "#5AE8D9"]
      }
      info.each do |slug, (description, color)|
        ClassifiedListingCategory.
          where(slug:slug).
          update(social_preview_description: description, social_preview_color: color)
      end
    end
  end
end
