# -*- coding: utf-8 -*-
require "spec_helper"

describe "Chapter views" do

  subject { page }

  let(:admin) { FactoryGirl.create(:admin) }
  let(:user) { FactoryGirl.create(:user) }
  let(:section) { FactoryGirl.create(:section) }
  let(:online_chapter) { FactoryGirl.create(:chapter, section: section, online: true) }
  let(:offline_chapter) { FactoryGirl.create(:chapter, section: section, online: false) }
  
  describe "visitor" do
    describe "visit chapter/show for offline chapter" do
      before { visit chapter_path(offline_chapter) }
      it { should_not have_selector("h1", text: offline_chapter.name) }
    end
    
    describe "visit chapter/show for online chapter" do
      before { visit chapter_path(online_chapter) }
      it { should have_selector("h1", text: online_chapter.name) }
    end 
  end

  describe "user" do
    before { sign_in user }
    
    describe "visit chapter/show for offline chapter" do
      before { visit chapter_path(offline_chapter) }
      it { should_not have_selector("h1", text: offline_chapter.name) }
    end
    
    describe "visit chapter/show for online chapter" do
      before { visit chapter_path(online_chapter) }
      it { should have_selector("h1", text: online_chapter.name) }
      it { should_not have_link("Modifier les prérequis") }
      it { should_not have_link("Modifier ce chapitre") }
      it { should_not have_link("point théorique") }
      it { should_not have_link("QCM") }
    end 
  end

  describe "admin" do
    before { sign_in admin }
    
    describe "visits chapter/show for offline chapter" do
      before { visit chapter_path(offline_chapter) }
      it { should have_selector("h1", text: offline_chapter.name) }
      it { should have_link("Modifier les prérequis") }
      it { should have_link("Modifier ce chapitre") }
      it { should have_link("point théorique") }
      it { should have_link("QCM") }
    end
    
    describe "visits chapter/show for online chapter" do
      before { visit chapter_path(online_chapter) }
      it { should have_selector("h1", text: online_chapter.name) }
      it { should have_link("Modifier les prérequis") }
      it { should have_link("Modifier ce chapitre") }
      it { should have_link("point théorique") }
      it { should have_link("QCM") }
    end 
  end
end
