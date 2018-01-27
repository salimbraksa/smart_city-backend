json.extract! issue, :id, :city
json.likes issue.get_likes.size
json.samples issue.issue_items

