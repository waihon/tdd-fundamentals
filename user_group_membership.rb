class User
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Group
  attr_reader :group_name

  def initialize(group_name)
    @group_name = group_name
  end
end

class Membership
  attr_reader :user
  attr_reader :group
  #attr_reader :admin

  def initialize(user:, group:, admin: false)
    @user = user
    @group = group
    @admin = admin
  end

  def promote_to_admin
    @admin = true
  end

  def admin?
    @admin  
  end
end

describe "#promote_to_admin" do
  it "makes a regular membership an admin membership" do
    membership_to_promote = build_non_admin_membership

    membership_to_promote.promote_to_admin

    expect(membership_to_promote).to be_admin
  end


  it "doesn't change other memberships" do
    membership_to_promote = build_non_admin_membership
    membership_not_to_promote = build_non_admin_membership

    membership_to_promote.promote_to_admin

    expect(membership_not_to_promote).not_to be_admin
  end

  def build_non_admin_membership
    user = User.new("New User")
    group = Group.new("New Group")

    Membership.new(user: user, group: group, admin: false)
  end
end
