module BreadcrumbHelper
  def breadcrumbs(*crumbs)
    render partial: "breadcrumbs", locals: { crumbs: crumbs }
  end

  def crumb(text, link = nil)
    [text, link]
  end
end
