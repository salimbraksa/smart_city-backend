json.extract! issue, :id, :city
json.confirms issue.get_likes.size
json.samples issue.issue_items
json.coordinate do
	json.latitude issue.latitude
	json.longitude issue.longitude
end
json.confirmed @user.liked? issue

