require 'spec_helper'

response = <<-EOF
  <project>
    <createTime>2010-10-04T12:52:31</createTime>
    <description>Agilezen wrapper</description>
    <id>14222</id>
    <name>zenapi</name>
    <owner>
      <id>5462</id>
      <name>dnurzynski</name>
    </owner>
  </project>
EOF

describe ZenApi::Resource do

  describe 'project' do
    let(:project) { ZenApi::Project.parse response }
    subject { project }

    its(:id) { should eql 14222 }
    its(:name) { should eql 'zenapi' }
    its(:description) { should eql 'Agilezen wrapper' }
    its('createTime.to_s') { should eql '2010-10-04T12:52:31+00:00' }

    describe :owner do
      subject { project.owner }
      its(:id) { should eql 5462 }
      its(:name) { should eql 'dnurzynski' }
    end
  end

end
