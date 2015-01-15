require 'spec_helper'

describe 'apache::mod::authnz_mellon', :type => :class do
  let :pre_condition do
    'include apache'
  end

  context "on a Debian OS" do
    let :facts do
      {
        :lsbdistcodename        => 'squeeze',
        :osfamily               => 'Debian',
        :operatingsystemrelease => '6',
        :concat_basedir         => '/dne',
        :id                     => 'root',
        :kernel                 => 'Linux',
        :operatingsystem        => 'Debian',
        :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      }
    end
    it { is_expected.to contain_class("apache::params") }
    it { is_expected.to contain_class("apache::mod::mellon") }
    it { is_expected.to contain_apache__mod('authnz_mellon') }
    it { is_expected.to contain_file('authnz_mellon.conf') }

  end #Debian

  context "on a RedHat OS" do
    let :facts do
      {
        :osfamily               => 'RedHat',
        :operatingsystemrelease => '6',
        :concat_basedir         => '/dne',
        :id                     => 'root',
        :kernel                 => 'Linux',
        :operatingsystem        => 'RedHat',
        :path                   => '/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin',
      }
    end
    it { is_expected.to contain_class("apache::params") }
    it { is_expected.to contain_class("apache::mod::mellon") }
    it { is_expected.to contain_apache__mod('authnz_mellon') }
    it { is_expected.to contain_file('authnz_mellon.conf') }

  end # Redhat

end

